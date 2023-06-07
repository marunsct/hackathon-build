using {
    Currency,
    User,
    managed,
    cuid
} from '@sap/cds/common';

entity plants : cuid {

    Plant_Name        : String;
    Botanical_Name    : String;
    Planting_Season   : String;
    Default_Image     : LargeBinary @Core.MediaType: 'image/png';
    Season1_Image     : LargeBinary @Core.MediaType: 'image/png';
    Season2_Image     : LargeBinary @Core.MediaType: 'image/png';
    Season3_Image     : LargeBinary @Core.MediaType: 'image/png';
    Season4_Image     : LargeBinary @Core.MediaType: 'image/png';
    Size              : Decimal(10, 2);
    Area_Required     : Decimal(10, 2);
    area_unit         : String;
    Water_Requirement : Decimal(10, 2);
    water_unit        : String;
    Sunlight          : String;
    lifespan          : String;

}

entity Orders : cuid, managed {
    OrderNo  : String(22) @title: 'Order Number';
    items    : Composition of many Items on items.Order = $self;
    buyer : String;
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
}
