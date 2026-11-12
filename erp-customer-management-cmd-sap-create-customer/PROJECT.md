#Payload
{
  "header": {
    "messageId": "9f8b7a6c-5d4e-3f2a-1b0c-9d8e7f6a5b4c",
    "correlationId": "txn-20261112-001",
    "serviceName": "erp-customer-management-cmd-sap-create-customer",
    "timestamp": "2026-11-12T10:36:00-06:00",
    "sourceSystem": "CRM-PORTAL",
    "targetSystem": "SAP-S4HANA"
  },
  "payload": {
    "BusinessPartnerCategory": "2",
    "BusinessPartnerGrouping": "BP02",
    "OrganizationBPName1": "Distribuidora El Sol S.A.",
    "SearchTerm1": "ELSOL",
    "Language": "ES",
    "to_BusinessPartnerRole": {
      "results": [
        {
          "BusinessPartnerRole": "FLCU01"
        }
      ]
    },
    "to_BusinessPartnerAddress": {
      "results": [
        {
          "Country": "GT",
          "Region": "04",
          "CityName": "Chimaltenango",
          "PostalCode": "04001",
          "StreetName": "1a Avenida 2-30 Zona 1",
          "to_EmailAddress": {
            "results": [
              {
                "EmailAddress": "contacto@distribuidoraelsol.com.gt"
              }
            ]
          }
        }
      ]
    },
    "to_BusinessPartnerTax": {
      "results": [
        {
          "BPTaxType": "GT1",
          "BPTaxNumber": "12345678"
        }
      ]
    },
    "to_Customer": {
      "to_CustomerSalesArea": {
        "results": [
          {
            "SalesOrganization": "1000",
            "DistributionChannel": "10",
            "Division": "00",
            "Currency": "GTQ",
            "CustomerPricingProcedure": "1",
            "ShippingCondition": "01"
          }
        ]
      },
      "to_CustomerCompany": {
        "results": [
          {
            "CompanyCode": "1000",
            "ReconciliationAccount": "12100000",
            "PaymentTerms": "0001"
          }
        ]
      }
    }
  }
}
