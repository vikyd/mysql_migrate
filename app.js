const mysql = require("mysql");

const con = mysql.createConnection({
  host: "127.0.0.1",
  port: 3306,
  user: "root",
  password: "yourPassword",
});

con.connect(function (err) {
  if (err) throw err;

  const sql = `
SELECT
  table_schema "dbname",
  ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "MB"
FROM
  information_schema.tables
GROUP BY
  table_schema
ORDER BY
  MB ASC;
`;

  con.query(sql, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    console.log(result.map((x) => `"${x.dbname}"`).join(" "));
    con.end();
  });
});
