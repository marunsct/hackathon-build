const cds = require("@sap/cds");
const SequenceHelper = require("./lib/SequenceHelper");
const { data } = require("hdb/lib/protocol");

module.exports = cds.service.impl(async (service) => {
  const db = await cds.connect.to("db");
  const { Order, items } = service.entities;

  service.before("CREATE", Order, async (context) => {
    const OrderId = new SequenceHelper({
      db: db,
      sequence: "ORDER_ID",
      table: "Orders",
      field: "ID",
    });

    context.data.ID = await OrderId.getNextNumber();
    // context.data.OrderNo = await OrderId.getOrderNumber();
    console.log(context.data);
  });

  service.before("CREATE", items, async (context) => {
    const ItemId = new SequenceHelper({
      db: db,
      sequence: "ITEMS_ID",
      table: "Items",
      field: "ID",
    });

    context.data.ID = await ItemId.getNextNumber();
    // context.data.OrderNo = await OrderId.getOrderNumber();
    console.log(context.data);
  });
});
