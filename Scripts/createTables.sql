-- Disconnect from database first
DISCONNECT cake;
DEACTIVATE DATABASE cake;

-- Back up current database
-- For some reason, Windows doesn't like using relative directories
-- like '../Backups' which would work on Unix systems
-- But we should not presume that a user has a certain directory available
-- on their system, so this creates a backup in the current working directory.
BACKUP DATABASE cake;

DROP DATABASE cake;

CREATE DATABASE cake;

CONNECT TO cake;

CREATE TABLE manager (
  MgrId INT 
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (MgrId >= 1)
    NOT NULL,
  MgrFirstName VARCHAR(20)
    NOT NULL,
  MgrMiddleName VARCHAR(20)
    NOT NULL,
  MgrLastName VARCHAR(20)
    NOT NULL,
  MgrStreet VARCHAR(40)
    NOT NULL,
  MgrCity VARCHAR(40)
    NOT NULL,
  MgrProvince VARCHAR(40)
    NOT NULL,
  MgrEmailAddress VARCHAR(50)
    NOT NULL,
  MgrDateOfBirth DATE
    NOT NULL,
  MgrAge INT
    CHECK (99 >= MgrAge AND MgrAge >= 18)
    NOT NULL,
  MgrMonthlySalary DECIMAL(10, 2)
    NOT NULL,
  MgrSSS VARCHAR(10)
    NOT NULL,
  MgrPagIbig VARCHAR(14)
    NOT NULL,
  MgrPhilHealth VARCHAR(14)
    NOT NULL,
  MgrTIN VARCHAR(14)
    NOT NULL,
  MgrStartOfEmploymentDate DATE
    DEFAULT CURRENT_DATE
    NOT NULL,
  MgrDateOfSeparation DATE,

  PRIMARY KEY (MgrId)
);

CREATE TABLE manager_phone (
  MgrPhoneId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (MgrPhoneId >= 1)
    NOT NULL,
  MgrId INT
    NOT NULL,
  MgrPhoneNo VARCHAR(10)
    NOT NULL,

  PRIMARY KEY (MgrPhoneId),
  FOREIGN KEY (MgrId)
    REFERENCES manager (MgrId)
    ON UPDATE RESTRICT
    ON DELETE CASCADE
);

CREATE TABLE employee (
  EmpId INT 
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (EmpId >= 1)
    NOT NULL,
  EmpFirstName VARCHAR(20)
    NOT NULL,
  EmpMiddleName VARCHAR(20)
    NOT NULL,
  EmpLastName VARCHAR(20)
    NOT NULL,
  EmpStreet VARCHAR(40)
    NOT NULL,
  EmpCity VARCHAR(40)
    NOT NULL,
  EmpProvince VARCHAR(40)
    NOT NULL,
  EmpEmailAddress VARCHAR(50)
    NOT NULL,
  EmpDateOfBirth DATE
    NOT NULL,
  EmpAge INT
    CHECK (99 >= EmpAge AND EmpAge >= 18)
    NOT NULL,
  EmpPosition VARCHAR(30)
    NOT NULL,
  EmpMonthlySalary DECIMAL(10, 2)
    CHECK (EmpMonthlySalary >= 0)
    NOT NULL,
  EmpSSS VARCHAR(10)
    NOT NULL,
  EmpPagIbig VARCHAR(14)
    NOT NULL,
  EmpPhilHealth VARCHAR(14)
    NOT NULL,
  EmpTIN VARCHAR(14)
    NOT NULL,
  EmpStartOfEmploymentDate DATE
    DEFAULT CURRENT_DATE
    NOT NULL,
  EmpDateOfSeparation DATE,
  MgrId INT
    NOT NULL,

  PRIMARY KEY (EmpId),
  FOREIGN KEY (MgrId)
    REFERENCES manager (MgrId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE employee_phone (
  EmpPhoneId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (EmpPhoneId >= 1)
    NOT NULL,
  EmpId INT
    NOT NULL,
  EmpPhoneNo VARCHAR(10)
    NOT NULL,

  PRIMARY KEY (EmpPhoneId),
  FOREIGN KEY (EmpId)
    REFERENCES employee (EmpId)
    ON UPDATE RESTRICT
    ON DELETE CASCADE
);

CREATE TABLE customer (
  CustId INT 
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    NOT NULL,
  CustFirstName VARCHAR(20),
  CustMiddleName VARCHAR(20),
  CustLastName VARCHAR(20),
  CustStreet VARCHAR(40),
  CustCity VARCHAR(40),
  CustProvince VARCHAR(40),
  CustEmailAddress VARCHAR(50),

  PRIMARY KEY (CustId)
);

CREATE TABLE customer_phone (
  CustPhoneId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (CustPhoneId >= 1)
    NOT NULL,
  CustId INT
    NOT NULL,
  CustPhoneNo VARCHAR(10)
    NOT NULL,

  PRIMARY KEY (CustPhoneId),
  FOREIGN KEY (CustId)
    REFERENCES customer (CustId)
    ON UPDATE RESTRICT
    ON DELETE CASCADE
);

CREATE TABLE product (
  ProdId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (ProdId >= 1)
    NOT NULL,
  ProdName VARCHAR(40)
    NOT NULL,
  ProdSellingPrice DECIMAL(10, 2)
    CHECK (ProdSellingPrice >= 0)
    NOT NULL,
  ProdQty INT
    CHECK (ProdQty >= 0)
    NOT NULL,

  PRIMARY KEY (ProdId)
);

CREATE TABLE supplies (
  SupplyId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (SupplyId >= 1)
    NOT NULL,
  SupplyName VARCHAR(30)
    NOT NULL,
  SupplyQty DECIMAL(8, 2)
    CHECK (SupplyQty >= 0)
    NOT NULL,
  SupplyUnitOfMeasurement VARCHAR(20)
    NOT NULL,

  PRIMARY KEY (SupplyId)
);

CREATE TABLE supplier (
  SupplierId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (SupplierId >= 1)
    NOT NULL,
  SupplierName VARCHAR(40)
    NOT NULL,
  SupplierStreet VARCHAR(40)
    NOT NULL,
  SupplierCity VARCHAR(40)
    NOT NULL,
  SupplierProvince VARCHAR(40)
    NOT NULL,
  SupplierEmailAddress VARCHAR(50)
    NOT NULL,
  
  PRIMARY KEY (SupplierId)
);

CREATE TABLE supplier_phone (
  SupplierPhoneId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (SupplierPhoneId >= 1)
    NOT NULL,
  SupplierId INT
    NOT NULL,
  SupplierPhoneNo VARCHAR(10)
    NOT NULL,

  PRIMARY KEY (SupplierPhoneId),
  FOREIGN KEY (SupplierId)
    REFERENCES supplier (SupplierId)
    ON UPDATE RESTRICT
    ON DELETE CASCADE
);

CREATE TABLE sale (
  SaleId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    NOT NULL,
  CustId INT
    NOT NULL,
  EmpId INT
    NOT NULL,
  SaleDate DATE
    DEFAULT CURRENT_DATE 
    NOT NULL,
  SaleTime TIME
    DEFAULT CURRENT_TIME
    NOT NULL,
  SaleSubtotal DECIMAL(10, 2)
    CHECK (SaleSubtotal >= 0)
    DEFAULT 0
    NOT NULL,

  PRIMARY KEY (SaleId),
  FOREIGN KEY (CustId)
    REFERENCES customer (CustId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (EmpId)
    REFERENCES employee (EmpId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE sale_line_item (
  SaleLineItemId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    NOT NULL,
  SaleId INT
    NOT NULL,
  ProdId INT
    NOT NULL,
  SaleLineItemPrice DECIMAL(10, 2)
    CHECK (SaleLineItemPrice >= 0)
    NOT NULL,
  SaleLineItemQty INT
    CHECK (SaleLineItemQty >= 1)
    NOT NULL,

  PRIMARY KEY (SaleLineItemId),
  FOREIGN KEY (SaleId)
    REFERENCES sale (SaleId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (ProdId)
    REFERENCES product (ProdId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE product_order (
  ProdOrderId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (ProdOrderId >= 1)
    NOT NULL,
  CustId INT
    NOT NULL,
  EmpId INT
    NOT NULL,
  ProdOrderSubtotal DECIMAL(10, 2)
    CHECK (ProdOrderSubtotal >= 0)
    DEFAULT 0
    NOT NULL,
  ProdOrderDate DATE
    DEFAULT CURRENT_DATE
    NOT NULL,
  ProdOrderTime TIME
    DEFAULT CURRENT_TIME
    NOT NULL,

  PRIMARY KEY (ProdOrderId),
  FOREIGN KEY (CustId)
    REFERENCES customer (CustId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (EmpId)
    REFERENCES employee (EmpId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE product_order_line_item (
  ProdOrderLineItemId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (ProdOrderLineItemId >= 1)
    NOT NULL,
  ProdOrderId INT
    NOT NULL,
  ProdId INT
    NOT NULL,
  ProdOrderLineItemPrice DECIMAL(10, 2)
    CHECK (ProdOrderLineItemPrice >= 0)
    NOT NULL,
  ProdOrderLineItemQty INT
    CHECK (ProdOrderLineItemQty >= 1)
    NOT NULL,
  
  PRIMARY KEY (ProdOrderLineItemId),
  FOREIGN KEY (ProdOrderId)
    REFERENCES product_order (ProdOrderId)
    ON UPDATE RESTRICT
    ON DELETE CASCADE,
  FOREIGN KEY (ProdId)
    REFERENCES product (ProdId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE purchase_order (
  PurchaseOrderId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (PurchaseOrderId >= 1)
    NOT NULL,
  SupplierId INT
    NOT NULL,
  EmpId INT
    NOT NULL,
  PurchaseOrderDueDate DATE
    NOT NULL,
  PurchaseOrderDate DATE
    DEFAULT CURRENT_DATE
    NOT NULL,
  PurchaseOrderTime TIME
    DEFAULT CURRENT_TIME
    NOT NULL,
  ProdOrderSubtotal DECIMAL(10, 2)
    CHECK (ProdOrderSubtotal >= 0)
    DEFAULT 0
    NOT NULL,
  

  PRIMARY KEY (PurchaseOrderId),
  FOREIGN KEY (SupplierId)
    REFERENCES supplier (SupplierId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (EmpId)
    REFERENCES employee (EmpId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE purchase_order_line_item (
  PurchaseOrderLineItemId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (PurchaseOrderLineItemId >= 1)
    NOT NULL,
  PurchaseOrderId INT
    NOT NULL,
  SupplyId INT
    NOT NULL,
  PurchaseOrderLineItemPrice DECIMAL(10, 2)
    CHECK (PurchaseOrderLineItemPrice >= 0)
    NOT NULL,
  PurchaseOrderLineItemQty INT
    CHECK (PurchaseOrderLineItemQty >= 1)
    NOT NULL,
  
  PRIMARY KEY (PurchaseOrderLineItemId),
  FOREIGN KEY (PurchaseOrderId)
    REFERENCES purchase_order (PurchaseOrderId)
    ON UPDATE RESTRICT
    ON DELETE CASCADE,
  FOREIGN KEY (SupplyId)
    REFERENCES supplies (SupplyId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE supply_delivery (
  SupplyDeliveryId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (SupplyDeliveryId >= 1)
    NOT NULL,
  SupplierId INT
    NOT NULL,
  EmpId INT
    NOT NULL,
  PurchaseOrderId INT
    NOT NULL,
  SupplyDeliveryPaymentDueDate DATE
    NOT NULL,
  SupplyDeliveryDate DATE
    DEFAULT CURRENT_DATE
    NOT NULL,
  SupplyDeliveryTime TIME
    DEFAULT CURRENT_TIME
    NOT NULL,

  PRIMARY KEY (SupplyDeliveryId),
  FOREIGN KEY (SupplierId)
    REFERENCES supplier (SupplierId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (EmpId)
    REFERENCES employee (EmpId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (PurchaseOrderId)
    REFERENCES purchase_order (PurchaseOrderId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE supply_usage (
  SupplyUsageId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (SupplyUsageId >= 1)
    NOT NULL,
  SupplyId INT
    NOT NULL,
  ProdId INT
    NOT NULL,
  SupplyUsageQty DECIMAL(8, 2)
    CHECK (SupplyUsageQty > 0)
    NOT NULL,
  
  PRIMARY KEY (SupplyUsageId),
  FOREIGN KEY (SupplyId)
    REFERENCES supplies (SupplyId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (ProdId)
    REFERENCES product (ProdId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE product_delivery (
  ProdDeliveryId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
      CHECK (ProdDeliveryId >= 1)
    NOT NULL,
  CustId INT
    NOT NULL,
  EmpId INT
    NOT NULL,
  ProdOrderId INT
    NOT NULL,
  ProdDeliveryStreet VARCHAR(40)
    NOT NULL,
  ProdDeliveryCity VARCHAR(40)
    NOT NULL,
  ProdDeliveryProvince VARCHAR(40)
    NOT NULL,
  ProdDeliveryDate DATE
    DEFAULT CURRENT_DATE
    NOT NULL,
  ProdDeliveryTime TIME
    DEFAULT CURRENT_TIME
    NOT NULL,

  PRIMARY KEY (ProdDeliveryId),
  FOREIGN KEY (CustId)
    REFERENCES customer (CustId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (EmpId)
    REFERENCES employee (EmpId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (ProdOrderId)
    REFERENCES product_order (ProdOrderId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE supply_payment (
  SupplyPaymentId INT
    GENERATED BY DEFAULT AS IDENTITY
      (START WITH 1, INCREMENT BY 1)
    CHECK (SupplyPaymentId >= 1)
    NOT NULL,
  SupplierId INT
    NOT NULL,
  EmpId INT
    NOT NULL,
  SupplyDeliveryId INT
    NOT NULL,
  SupplyPaymentTotalAmountDue DECIMAL(10, 2)
    CHECK (SupplyPaymentTotalAmountDue >= 0)
    NOT NULL,
  SupplyPaymentDate DATE
    DEFAULT CURRENT_DATE
    NOT NULL,
  SupplyPaymentTime TIME
    DEFAULT CURRENT_TIME
    NOT NULL,

  PRIMARY KEY (SupplyPaymentId),
  FOREIGN KEY (SupplierId)
    REFERENCES supplier (SupplierId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (EmpId)
    REFERENCES employee (EmpId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT,
  FOREIGN KEY (SupplyDeliveryId)
    REFERENCES supply_delivery (SupplyDeliveryId)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);