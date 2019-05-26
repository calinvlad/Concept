'use strict';
const bcrypt = require('bcrypt')

function hash(user, options) {
  const saltRounds = 10;
  return bcrypt.genSalt(saltRounds)
      .then(salt => bcrypt.hash(user.pass, salt, null))
      .then(hash => {
        user.setDataValue('pass', hash)
      })
}

module.exports = (sequelize, DataTypes) => {
  const Users = sequelize.define('Users', {
    userId: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'user_id'
    },
    fname: {
      type: DataTypes.STRING,
      allowNull: false,
      field: 'fname'
    },
    lname: {
      type: DataTypes.STRING,
      allowNull: false,
      field: 'lname'
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      field: 'email'
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false,
      field: 'phone'
    },
    pass: {
      type: DataTypes.STRING,
      allowNull: false,
      field: 'pass'
    }
  }, {
    timestamps: false,
    hooks: {
      beforeCreate: hash,
      beforeUpdate: hash
    }
  });
  Users.associate = function(models) {
    // associations can be defined here
  };

  return Users;
};