desc T;


show index from T

create table T(
    id int, gender ENUM('Male','Female'),
    constraint pk_p PRIMARY KEY (id)
);