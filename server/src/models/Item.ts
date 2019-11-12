const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const EntrySchema = new Schema({
    name: {
        type: String,
        required: true,
    },
    checklist: {
        type: Boolean,
        default: false,
    },
    text: {
        type: String,
        required: true,
    },
});

const CategorySchema = new Schema({
    vaccination: {
        type: [EntrySchema],
        required: true,
    },
    illness: {
        type: [EntrySchema],
        required: true,
    },
    insurance: {
        type: [EntrySchema],
        required: true,
    },
    water: {
        type: [EntrySchema],
        required: true,
    },
});

const CountrySchema = new Schema({
    countryName: {
        type: String,
        required: true,
    },
    countryCode: {
        type: String,
        required: true,
    },
    categories: {
        type: CategorySchema,
        required: true,

    }
});


const UserSchema = new Schema({
    userId: {
        type: String,
        required: true,
    },
    firstName: {
        type: String,
        required: true,
    },
    lastName: {
        type: String,
        required: true,
    },
    birthDate: {
        type: Date,
        required: true,
    },
    checked: {
        type: [String],
        required: true,
    },
});

const Country = mongoose.model('country', CountrySchema);
const User = mongoose.model('user', UserSchema);


module.exports = {
    country : Country,
    user: User,
};
