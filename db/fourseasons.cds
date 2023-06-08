using {
    Currency,
    User,
    managed,
    cuid
} from '@sap/cds/common';

entity plants : cuid {

    Plant_Name        : String;
    Botanical_Name    : String;
    Category          : String;
    Planting_Season   : String;
    Default_Image     : LargeBinary ;
    autmn_Image       : LargeBinary ;
    spring_Image      : LargeBinary ;
    summer_Image      : LargeBinary ;
    winter_Image      : LargeBinary ;
    Size              : String;
    Area_Required     : String;
    area_unit         : String;
    water_Requirement : String;
    water_unit        : String;
    Sunlight          : String;
    lifespan          : String;

}

entity Orders : cuid, managed {
    OrderNo  : String(22) @title: 'Order Number';
    items    : Composition of many Items
                   on items.Order = $self;
    buyer    : String;
    currency : Currency;

}

entity Items : cuid {

    Order    : Association to Orders;
    plant    : Association to plants;
    quantity : Integer;
    title    : String; //> intentionally replicated as snapshot from product.title
    price    : Double; //> materialized calculated field
};

entity Rating {
    key ID        : Integer;
        screen    : Integer;
        operation : Integer;
        order     : Integer;
        User      : String;
}

entity BlobTest : cuid {
imagedata : LargeBinary;
mimetype : String(100);
}