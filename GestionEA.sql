CREATE TABLE nameperson ( 
    id_name  INT PRIMARY KEY IDENTITY(1,1), 
    firt_name VARCHAR(15) NOT NULL, 
    second_name VARCHAR(15) NOT NULL 
); 
CREATE TABLE dateperson( 
    id_date INT PRIMARY KEY IDENTITY(1,1), 
    birth DATE NOT NULL, 
); 
CREATE TABLE contact( 
    id_contact INT PRIMARY KEY IDENTITY(1,1), 
    email VARCHAR(80) UNIQUE NOT NULL, 
    direction VARCHAR(100)  NOT NULL, 
    phone INT UNIQUE NOT NULL 
); 
CREATE TABLE typefood( 
    id_type_food INT PRIMARY KEY IDENTITY(1,1), 
    category VARCHAR(60) NOT NULL UNIQUE 
); 
CREATE TABLE deadlinedate( 
    id_dead_line_date INT PRIMARY KEY IDENTITY(1,1), 
    fabrication DATE NOT NULL, 
    expiration DATE NOT NULL 
); 
CREATE TABLE cost( 
    id_cost INT PRIMARY KEY IDENTITY(1,1), 
    price DECIMAL(10,2) DEFAULT 0.0, 
    IVA DECIMAL(4,2) DEFAULT 0.0
); 
CREATE TABLE person( 
    identification_card INT PRIMARY KEY, 
    id_name INT NOT NULL, 
    id_contact INT NOT NULL,
    id_date INT NOT NULL,
    FOREIGN KEY (id_contact) REFERENCES contact(id_contact), 
    FOREIGN KEY (id_name) REFERENCES nameperson(id_name), 
    FOREIGN KEY (id_date) REFERENCES dateperson(id_date) 
); 
CREATE TABLE supplier(
    nfc INT PRIMARY KEY,
    name_supplier VARCHAR(30) UNIQUE NOT NULL,
    id_contact INT NOT NULL,
    FOREIGN KEY (id_contact) REFERENCES contact(id_contact)
);
--purchase product
CREATE TABLE purchaseinvoice(
    id_pucharse_invoice INT PRIMARY KEY IDENTITY(1,1),
    number_document INT NOT NULL,
    upc INT NOT NULL,
    nfc INT NOT NULL,
    FOREIGN KEY (upc) REFERENCES food(upc),
    FOREIGN KEY (nfc) REFERENCES supplier(nfc),
    FOREIGN KEY (number_document) REFERENCES invoice(number_document)
);
CREATE TABLE invoice(
    number_document INT PRIMARY KEY,
    id_dead_line_date INT ,
    FOREIGN KEY (id_dead_line_date) REFERENCES deadlinedate(id_dead_line_date)
);
CREATE TABLE food(
    upc INT PRIMARY KEY,
    unidad INT DEFAULT 0,
   id_dead_line_date INT NOT NULL,
    id_cost INT NOT NULL,
    id_type_food INT NOT NULL,
    FOREIGN KEY (id_dead_line_date) REFERENCES deadlinedate(id_dead_line_date),
    FOREIGN KEY (id_cost) REFERENCES cost(id_cost),
    FOREIGN KEY (id_type_food) REFERENCES typefood(id_type_food)
   );
