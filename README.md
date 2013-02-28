Below are some quick highlights of the code:

* Fixed an error in the migration. Renamed the type field to product_type as type is used for managing polymorphic association. Updated the model accordingly.
* In products controller, respond_width was being used instead of respond_with, which was a syntax error. Resolved that.
* Used SQLite3 instead of MySQL temporarily so one can execute the code rightaway and don't need to update the database settings.
* Added some seed products as well. For a clean database setup, do a bundle install and run rake db:reset.
* Integrated twitter bootstrap and devise in the project as well.