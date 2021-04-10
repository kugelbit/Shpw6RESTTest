# Shopware 6 REST-API Communication Test Tool

This is a basic linux-bash-script to interact with the Shopware 6 REST-API. So you can get and push information from Shopware. The Script uses curl and jq.
Its only for testing. Production use is not recommended. 

## Usage

```
./cmd.sh [kind of request] [url] [json input file (optional)]
```

### Requests

- **TOKEN** is used to get OAuth-Token from shopware More Information: <https://developer.shopware.com/docs/guides/integrations-api/admin-api/authentication>
The token is needed to use other requests.
Example:

```
./cmd.sh TOKEN https://myShop.de ./config.json
```

You need an json-file with the api-credentials of your shop (example file: config.json).
The Token will be saved in an file called token. This token-file will be used for every other request and must be refreshed ervery five minutes.



- **GET** is used to receive information from your shop. (this request can only be used with an valid token. See TOKEN Request for more details) 
The result will be printed and copied to clipboard.

Examples:

Get all orders:
```
./cmd.sh GET https://myShop.de/api/v3/order
```

Get special order:
```
./cmd.sh GET https://myShop.de/api/v3/order/521fe769d24c452c90bbe60f96fd1cb1
```

Get product:
```
./cmd.sh GET https://myShop.de/api/v3/product/521fe769d24c452c90bbe60f96fd1cb1
```

For more examples see:
<https://developer.shopware.com/docs/guides/integrations-api/admin-api/reading-entities>

- **POST** is used to post new information to your shop. the information need to be an valid json file see ExampleJson directory for examples. (this request can only be used with an valid token. See TOKEN Request for more details)

Examples:

Post new Product:
```
./cmd.sh POST https://myShop.de/api/v3/product/ ./ExampleJson/a_salbe.json
```

Post new product property group:
```
./cmd.sh POST https://myShop.de/api/v3/property-group ./ExampleJson/a_salbe.json
```

Post product images see:
<https://stackoverflow.com/questions/63618200/add-images-via-shopware-6-api>

search all open orders:
```
./cmd.sh POST https://myShop.de//api/v3/search/order ./ExampleJson/open_orders.json
```

more information:
<https://developer.shopware.com/docs/guides/integrations-api/admin-api/reading-entities>
<https://developer.shopware.com/docs/guides/integrations-api/general-concepts/search-criteria>

for actual image upload:
```
./cmd.sh IMG https://myShop.de/api/v2/_action/media/media-id/upload?extension=jpg&fileName=amah ./a_salbe.jpg
```
- **PATCH** is used to  updated information in your shop. the information need to be an valid json file see ExampleJson directory for examples. (this request can only be used with an valid token. See TOKEN Request for more details)

Example:

update Product:
```
./cmd.sh PATCH https://myShop.de/api/v3/product/521fe769d24c452c90bbe60f96fd1cb1 ./ExampleJson/a_salbe.json
```

- **DELETE** is used to  delete information from your shop. (this request can only be used with an valid token. See TOKEN Request for more details)

Example

delete product:
```
./cmd.sh DELETE https://myShop.de/api/v3/order/521fe769d24c452c90bbe60f96fd1cb1
```
