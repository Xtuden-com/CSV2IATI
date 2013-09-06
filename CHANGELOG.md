# Changelog

## Version 2.0
Transactions are now handled differently, so if any models from the old version will need to be migrated before they work.

### Various UI improvements
Including:

* Ajax save button - This means that when the save button is pressed, you will not lose your position on the page.
* Copy/delete dimension are now icons in the top right of a dimension
* External URLs now open in a new window/tab
* Switching between column and fixed value is now a dropdown

### Admins can now reset passwords

### History

In the conversion panel, there is a view conversion history link, which lists previous conversion times and links to the associated XML files.

### List of IATI elements generated from schema

This means many new elements are supported, along with new descriptions pulled from the schema's inline documentation.

### Support for nested elements

Eg. Budget. Transactions also use this new format (see migration notes above), and will look slightly different.

### Post conversion links

There are now Preview/Validate links after an XML file has been converted.

### Dimensions can be copied

Simply click the copy dimension button, and enter a name for the new dimension.

### Virtual fields

Any field with a name beginning `virtual_` will not be outputted into the xml. This is useful for the Field Before/After transform.

### Alternatives

If you wish to use some other column/constant if a given field is blank, you can add an alternative. You can add as many alternatives as needed, but they will only be used if all preceding options are blank.

Currently you must delete all alternatives for a field before you can delete the field itself.

### Transforms

Transforms allow you to manipulate the value of a certain field in some way. Some transforms provide an extra text field, or drop downs to allow you to configure the transform.

#### Date

This transforms the given field to the required ISO date format. You must supply the format of the date using [the python strftime syntax](http://docs.python.org/2/library/datetime.html#strftime-strptime-behavior). For example, if your dates are of the form `dd/mm/yyyy` you should use `%d/%m/%Y`.

#### Multiply

This multiplies the field by the given value. Use this if your spreadsheet quotes transaction values in thousands, for example.

#### Text Before/After

These prepend/append the given text to the field. To do both, you should instead have a fixed value, with a Field After, which itself has a Field After.

#### Field Before/After

This prepends/append the content of the named field to this field.  ATM you must create the field manually, in the same place as the field that the transform that is applied to. Name this field with a `virtual_` prefix to avoid it being outputted into the xml on its own.

#### CRS -> Country/Region Code/Name

Given a column containing a CRS code, these transform it into the necessary codes and names for iati. If some codes are not working, check that the [current mapping](https://github.com/markbrough/CSV-IATI-Converter/blob/master/csviati/codes.py) is not out of date.

#### CRS Tied Status

This takes untied and partialtied columns and produces the Tied Status code required for IATI.

### Using both Alternatives and Transforms

Currently transforms on a field are applied first, then if this is blank alternatives are checked. Alternatives may have their own transforms.


