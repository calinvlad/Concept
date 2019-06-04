'use strict';
module.exports = (sequelize, DataTypes) => {
  const Products = sequelize.define('Products', {
    productId: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'product_id'
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
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: 'user_id'
    }
  }, {
    timestamps: false
  });
  Products.associate = function(models) {
    // associations can be defined here
    Products.belongsTo(models.Users, {
      foreignKey: 'userId',
      constraints: false
    })
    Products.hasMany(models.Images, {
      foreignKey: 'productId'
    })
  };
  return Products;
};
