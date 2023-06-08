const cds = require("@sap/cds");
const SequenceHelper = require("./lib/SequenceHelper");
const { data } = require("hdb/lib/protocol");

module.exports = cds.service.impl(async (service) => {
	const db = await cds.connect.to("db");
	const { Order } = service.entities;

	service.before("CREATE", Order, async (context) => {
		const OrderId = new SequenceHelper({
			db: db,
			sequence: "ORDER_ID",
			table: "Orders",
			field: "ID"
		});

		context.data.ID = await OrderId.getNextNumber();
        console.log(data);
	});
});