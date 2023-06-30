# MySQL migration scripts

Used for migrate multiple databases fron old mysql instance to new instance.

**Warning: this sh script will drop db in new mysql instance. You can modify the `drop` line in `migrate.sh`**

# Usage

1. open `migrate.sh`, modify old/new mysql instance configuration, modify `("db01" "db02")` to your db names.

2. run `migrate.sh`, over.

---

Internal logic:

1. dump db from old instance to local disk as `.sql` file
2. drop corresponding db in new instance
3. create corresponding db in new instance
4. restore tables/data to db in new instance

# Usage: get db names and size

If want to get db names/size in old instance, `app.js`, `package.json` are needed.

1. open `app.js`, modify mysql configuration.

2. run query:

```sh
npm install

node app.js
```
