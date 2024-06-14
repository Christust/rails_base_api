# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# PASOS

Descomentamos bycrypt

Creamos el modelo para los usuarios usando password_digest:

```
# Migracion
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :user_type
      t.string :password_digest

      t.timestamps
    end
  end
end

# Modelo

class User < ApplicationRecord
	has_secure_password

	validates :name, presence: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

	enum user_type: {superadmin: 1, admin: 2, common: 3}


end
```

Usando el metodo scafold generamos los modelos y controladores para Chefs y Recipes:

rails g scaffold Chef name:string
rails g scaffold Recipe name:string description:string steps:text chef:references

Ejecutamos las migraciones:

rails db:migrate

