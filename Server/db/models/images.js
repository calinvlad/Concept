'use strict';
module.exports = (sequelize, DataTypes) => {
    const Images = sequelize.define('Images', {
        imageId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
            field: 'image_id'
        },
        image: {
            type: DataTypes.STRING,
            allowNull: false,
            field: 'image'
        },
        productId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            field: 'product_id'
        }
    }, {
        timestamps: false
    });
    Images.associate = function(models) {
        Images.belongsTo(models.Products, {
            foreignKey: 'productId',
            constraints: true,
            onDelete: 'cascade'
        })
    };
    return Images;
};
