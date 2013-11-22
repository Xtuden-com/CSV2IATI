Changelog
=========

Verison 2.3
-----------

-  Update model encoding when a new file is uploaded
-  New download link, to make it easier for firewalled users to get the
   XML file
-  Add encoding override

UI Changes

-  Vertical space before convert button
-  Improve login error messages
-  Backend error messages look better
-  Text 'attribute' renamed

Version 2.2
-----------

The major change in this release is that the documentation has been
integrated into the conversion tool itself.

Some small user interface changes have been made to make it more obvious
that you can jump to a specific section in the modeleditor, and to move
the screen when a new element is added.

Version 2.1
-----------

From this release, this conversion tool is now known as CSV2IATI, to
avoid confusion with tools for converting to csv.

This release also marks the migration of the live version of the tool
from ``http://csvconverter.aidinfolabs.org/`` to
``http://csv2iati.iatistandard.org/``. User accounts and models have not
been migrated due to the large number of inactive users, and changes in
the way the model data format is structured. Please contact
support@iatistandard.org if you need support with transferring models.

Bug Fixes
~~~~~~~~~

-  All external links should now open in a new tab
-  Add XML Declaration to outputted files

UI improvements
~~~~~~~~~~~~~~~

-  More helpful errors when a file that is not a csv is uploaded
-  Left and right panels in the modeleditor now stick to the top
-  Elements are ordered consistently in outputted XML, and in the add
   new element dropdown
-  Right hand side panel rearranged - advanced tab has been removed,
   with it's functionality incorporated into the Add Attribute and Add
   Element dropdowns
-  Improved show JSON Link
-  Naming of elements/attributes made consistent

User features
~~~~~~~~~~~~~

-  Rename, delete and copy models
-  Change password dialog
-  Add field/Add a nested element links have been replaced with a
   unified dropdown that is prefilled with the appropriate entries from
   the schema.

Admin features
~~~~~~~~~~~~~~

-  All admins can see other admin's models
-  Move/copy models to another user

Version 2.0
-----------

Transactions are now handled differently, so if any models from the old
version will need to be migrated before they work.

Various UI improvements
~~~~~~~~~~~~~~~~~~~~~~~

Including:

-  Ajax save button - This means that when the save button is pressed,
   you will not lose your position on the page.
-  Copy/delete dimension are now icons in the top right of a dimension
-  External URLs now open in a new window/tab
-  Switching between column and fixed value is now a dropdown

New admin features
~~~~~~~~~~~~~~~~~~

-  Password reset
-  Create a model under any user

History
~~~~~~~

In the conversion panel, there is a view conversion history link, which
lists previous conversion times and links to the associated XML files.

List of IATI elements generated from schema
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This means many new elements are supported, along with new descriptions
pulled from the schema's inline documentation.

Support for nested elements
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Eg. Budget. Transactions also use this new format (see migration notes
above), and will look slightly different.

Post conversion links
~~~~~~~~~~~~~~~~~~~~~

There are now Preview/Validate links after an XML file has been
converted.

Dimensions can be copied
~~~~~~~~~~~~~~~~~~~~~~~~

Simply click the copy dimension button, and enter a name for the new
dimension.

New Advanced Features
~~~~~~~~~~~~~~~~~~~~~

The options for these can be found by clicking the wrench icon next to
any field.

Virtual fields
^^^^^^^^^^^^^^

Any field with a name beginning ``virtual_`` will not be outputted into
the xml. This is useful for the Field Before/After transform.

Alternatives
^^^^^^^^^^^^

If you wish to use some other column/constant if a given field is blank,
you can add an alternative. You can add as many alternatives as needed,
but they will only be used if all preceding options are blank.

Currently you must delete all alternatives for a field before you can
delete the field itself.

Transforms
^^^^^^^^^^

Transforms allow you to manipulate the value of a certain field in some
way. Some transforms provide an extra text field, or drop downs to allow
you to configure the transform.

-  **Date:** This transforms the given field to the required ISO date
   format. You must supply the format of the date using `the python
   strftime
   syntax <http://docs.python.org/2/library/datetime.html#strftime-strptime-behavior>`__.
   For example, if your dates are of the form ``dd/mm/yyyy`` you should
   use ``%d/%m/%Y``.

-  **Multiply:** This multiplies the field by the given value. Use this
   if your spreadsheet quotes transaction values in thousands, for
   example.

-  **Text Before/After:** These prepend/append the given text to the
   field. To do both, you should instead have a fixed value, with a
   Field After, which itself has a Field After.

-  **Field Before/After:** This prepends/append the content of the named
   field to this field. ATM you must create the field manually, in the
   same place as the field that the transform that is applied to. Name
   this field with a ``virtual_`` prefix to avoid it being outputted
   into the xml on its own.

-  **CRS -> Country/Region Code/Name:** Given a column containing a CRS
   code, these transform it into the necessary codes and names for iati.
   If some codes are not working, check that the `current
   mapping <https://github.com/markbrough/CSV-IATI-Converter/blob/master/csviati/codes.py>`__
   is not out of date.

-  **CRS Tied Status:** This takes untied and partialtied columns and
   produces the Tied Status code required for IATI.

Using both Alternatives and Transforms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Currently transforms on a field are applied first, then if this is blank
alternatives are checked. Alternatives may have their own transforms.
