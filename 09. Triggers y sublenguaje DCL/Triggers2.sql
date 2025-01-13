-- armar un trigger que asegure que la clave password de los usuarios 1,2,3,4,5 no se pueden modificar
-- armar un trigger que guarde el historial de contrasenias

USE gamersmodel;

SELECT * FROM system_user;

CREATE TABLE system_user_password_hist (
	id_system_user_hist int not null auto_increment primary key,
    id_system_user int not null, 
    password varchar(50),
    modification_date DATETIME not null
);


DELIMITER &&

	CREATE TRIGGER tr_prevent_password_update 
    BEFORE UPDATE ON system_user
    FOR EACH ROW
    BEGIN
		IF (new.id_system_user IN (1,2,3,4,5)) THEN
			SET new.password = old.password;
        ELSE
			INSERT INTO system_user_password_hist (id_system_user, password, modification_date)
			VALUES (NEW.id_system_user, NEW.password, NOW());
        END IF;
    END

&&
