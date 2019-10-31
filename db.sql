CREATE TABLE 'presentie' (
id int NOT NULL AUTO_INCREMENT,
studentid int NOT NULL,
vakid int NOT NULL,
datum date NOT NULL,
periode int NOT NULL, primary key (id),
Foreign key studentid REFERENCES student ('id')
Foreign key vakid REFERENCES vak ('id')
);


ALTER TABLE 'presentie'
ADD CONSTRAINT FOREIGN KEY (`klant_id`) REFERENCES `klant` (`klant_id`),
ADD CONSTRAINT FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers` (`freelancer_id`),