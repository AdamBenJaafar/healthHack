const express = require('express');
const router = express.Router();
const _ = require('lodash');

// Item Model
const CountryModel = require('../../models/Item').country;
const UserModel = require('../../models/Item').user;


// @route GET travel/:to/checklist
// @desc get checklist items
// @access public
router.get('/:to/checklist', ((req, res) => {
    const toLocation = req.params.to;
    CountryModel.findOne({countryCode: toLocation}).lean().then((toItem) =>{
        if( !toItem) {
            return res.status(404).json({success: false});
        } else {
            const categories = toItem.categories || {};
            const checkList = Object.keys(categories)
                .map((key) => {
                    const category = categories[key] || {entries: []};
                    return category.entries.filter((entry) => entry.checkList);
                });
            return res.json(_.flatten(checkList));

        }
    });
}));

// @route GET travel/:to/checklist
// @desc get checklist items
// @access public
router.get('/:user/:to/checklist', ((req, res) => {
    const toLocation = req.params.to;
    const userId = req.params.user;

    CountryModel.findOne({countryCode: toLocation}).lean().then((toItem) =>{
        if( !toItem) {
            return res.status(404).json({success: false});
        } else {

            const categories = toItem.categories || {};
            const checkList = Object.keys(categories)
                .map((key) => {
                    const category = categories[key] || {entries: []};
                    return category.entries.filter((entry) => entry.checkList);
                });

            UserModel.findOne({userId}).lean().then((user) =>{
               if (!user) {
                   res.status(404).json({success: false});
               } else {
                   const checkedItems = user.checked || [];
                   const flatCheckList = _.flatten(checkList);
                   const result = flatCheckList.map(element => {
                      return {
                          name: element.name,
                          text: element.text,
                          checked: checkedItems.includes(element.name),
                      }
                   });
                   res.json(result);
               }
            });
        }
    });
}));

// @route GET travel/:to/details
// @desc get details items
// @access public
router.get('/:user/:to/details', ((req, res) => {
    const toLocation = req.params.to;
    const userId = req.params.user;
    CountryModel.findOne({countryCode: toLocation}).lean().then((toItem) =>{
        if( !toItem) {
            return res.status(404).json({success: false});
        } else {
            const categories = toItem.categories || {};
            const sectionList = Object.keys(categories)
                .map((key) => {
                    const category = categories[key] || {entries: []};
                    const filteredCategories =  category.entries
                        .filter((entry) => !entry.checkList)
                        .map(entry => entry.text);
                    return {
                        title: category.title,
                        entries: filteredCategories,
                    }
                });

            return res.json(sectionList);
        }
    });
}));

// @route patch /:user/toggle/:checkname
// @desc toggle items
// @access public
router.patch('/:user/toggle/:checkname', ((req, res) => {
    const checkName = req.params.checkname;
    const userId = req.params.user;
    UserModel.findOne({userId}).lean().then((user) =>{
        if (!user) {
            res.status(404).json({success: false});
        } else {
            const checkedItems: string[] = user.checked || [];
            const newCheckedItems = (checkedItems.includes(checkName))
                ? checkedItems.filter((name) => name != checkName)
                : Array.from(new Set([...checkedItems, checkName]));
            UserModel.updateOne({userId}, {checked: newCheckedItems}).then(item =>{
                res.json({success: true});
            });

        }
    });
}));

module.exports = router;
export {};
