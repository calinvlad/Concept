'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Users', {
      user_id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
        field: 'user_id'
      },
      fname: {
        type: Sequelize.STRING,
        allowNull: false,
        field: 'fname'
      },
      lname: {
        type: Sequelize.STRING,
        allowNull: false,
        field: 'lname'
      },
      email: {
        type: Sequelize.STRING,
        allowNull: false,
        field: 'email'
      },
      phone: {
        type: Sequelize.STRING,
        allowNull: false,
        field: 'phone'
      },
      pass: {
        type: Sequelize.STRING,
        allowNull: false,
        field: 'pass'
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('Users');
  }
};