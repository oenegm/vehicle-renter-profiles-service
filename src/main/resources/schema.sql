create extension if not exists "uuid-ossp";


create table if not exists profiles
(
    id                   uuid primary key default uuid_generate_v4(),
    user_id              uuid        not nul,
    name                 varchar(45) not null,
    profile_picture_link varchar(255),
    bio                  text
);

create table if not exists communication_method_types
(
    id   uuid primary key default uuid_generate_v4(),
    name varchar(20) not null
);

create table if not exists communication_methods
(
    id         uuid primary key default uuid_generate_v4(),
    profile_id uuid references profiles (id),
    type       uuid references communication_method_types (id),
    value      varchar(255) not null
);
