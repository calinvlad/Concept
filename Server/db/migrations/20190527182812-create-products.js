'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Products', {
      productId: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: DataTypes.STRING,
        allowNull: false,
        field: 'name'
      },
      category: {
        type: DataTypes.STRING,
        allowNull: false,
        field: 'category'
      },
      price: {
        type: DataTypes.INTEGER,
        allowNull: false,
        field: 'price'
      },
      images: {
        type: DataTypes.STRING,
        allowNull: true,
        field: 'images'
      },
      userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        field: 'user_id'
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('Products');
  }
};