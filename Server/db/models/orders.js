'use strict';
module.exports = (sequelize, DataTypes) => {
    const Order = sequelize.define('Order', {
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
        },
        created: {
            type: 'TIMESTAMP',
            allowNull: false,
            field: 'created',
        },
        updated: {
            type: 'TIMESTAMP',
            allowNull: false,
            field: 'updated',
        }
    }, {
        timestamps: false,
        freezeTableName: true
    });
    Order.associate = function(models) {
        // associations can be defined here
        Order.belongsTo(models.User, {
            foreignKey: 'userId',
            constraints: false
        })
    };
    return Order;
};
