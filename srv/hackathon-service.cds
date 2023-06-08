using {
    Orders,
    plants,
    Rating,
    Items,
    BlobTest,
    PlantImages
} from '../db/fourseasons';

service Hackathon {
    @Capabilities: {
        Insertable: true,
        Deletable : false,
        Updatable : true
    }
    entity Order  as projection on Orders {
        ID,
        buyer,
        currency,
        modifiedAt,
        modifiedBy,
        createdAt,
        createdBy,
        Items : Composition of many items on Items.Order = $self
    };

    entity items  as projection on Items;

    entity plant  as projection on plants {
        ID, Plant_Name, Botanical_Name, Category, Planting_Season, Default_Image,autmn_Image, spring_Image, summer_Image, winter_Image, Size, Area_Required, area_unit, water_Requirement, water_unit, Sunlight, lifespan, 
        images : Association to one PlantImage on images.Plant = $self
};

@Capabilities: {
    Insertable: true,
    Deletable : false,
    Updatable : true
}
entity rating     as projection on Rating;

entity Blobtest   as projection on BlobTest;
entity PlantImage as projection on PlantImages;

}
