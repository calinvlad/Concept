'use strict';
module.exports = (sequelize, DataTypes) => {
    const Specs = sequelize.define('Specs', {
        specId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
            field: 'spec_id'
        },
        text: {
            type: DataTypes.TEXT,
            allowNull: false,
            field: 'text'
        },
        productId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            field: 'product_id'
        }
    }, {
        timestamps: false
    });
    Specs.associate = function(models) {
        Specs.belongsTo(models.Products, {
            foreignKey: 'productId',
            constraints: true,
            onDelete: 'cascade'
        })
    };
    return Specs;
};
