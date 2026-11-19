#Payload
-- -------------------------------------------------------------

{
  "serviceName": "erp-lab-management-create-sample",
  "correlationId": "txn-20261119-001",
  "timestamp": "2026-11-19 15:45:00",
  "data": {
    "sampleType": "ADN",
    "specimenOrigin": "Sangre periférica",
    "collectionDate": "2026-11-19",
    "subject": {
      "subjectId": "SUB-0010009999",
      "fullName": "Carlos Alberto Méndez",
      "documentId": "2548963210101"
    },
    "laboratory": {
      "labCode": "LAB-GT-01",
      "requestedBy": "Dra. Sofía Morales",
      "analysisType": "Secuenciación Genómica"
    },
    "storage": {
      "containerType": "Tubo EDTA 4ml",
      "temperatureCelsius": -20
    }
  }
}


-- ------------------------------------------------------------
#Response
-- ------------------------------------------------------------

{
  "serviceName": "erp-lab-management-create-sample",
  "correlationId": "txn-20261119-001",
  "timestamp": "2026-11-19 15:45:02",
  "status": "SUCCESS",
  "code": 201,
  "message": "Muestra de ADN creada correctamente",
  "data": {
    "sampleId": "DNA-2026-000845",
    "barcode": "7401000845992",
    "sampleStatus": "REGISTERED"
  }
}