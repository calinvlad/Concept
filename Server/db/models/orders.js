'use strict';
module.exports = (sequelize, DataTypes) => {
    const Orders = sequelize.define('Orders', {
        orderId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
            field: 'order_id'
        },
        userId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            field: 'user_id'
        },
        products: {
            type: DataTypes.STRING,
            allowNull: true,
            field: 'products'
        },
        total: {
            type: DataTypes.STRING,
            allowNull: true,
            field: 'total'
        },
        address: {
            type: DataTypes.STRING,
            allowNull: true,
            field: 'address'
        }
    }, {
        timestamps: false
    });
    Orders.associate = function(models) {
        // associations can be defined here
        Orders.belongsTo(models.Users, {
            foreignKey: 'userId',
            constraints: false
        })
    };
    return Orders;
};
