using {
    Orders,
    plants,
    Rating,
    Items
} from '../db/fourseasons';

service Hackathon  {
    @Capabilities: {
        Insertable: true,
        Deletable : false,
        Updatable : true
    }
    entity Order  as projection on Orders {
        ID,
        buyer,currency, modifiedAt,modifiedBy,createdAt,createdBy,
        Items : Composition of many items on Items.Order = $self
    };

    entity items as projection on Items;

    entity plant  as projection on plants;

    @Capabilities: {
        Insertable: true,
        Deletable : false,
        Updatable : true
    }
    entity rating as projection on Rating;

}
