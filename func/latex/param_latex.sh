# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker:

# Set the description of the function
set_desc add "Create a full template for a project LaTeX"

# Set a list of examples
set_desc add "new_project projectName article"
set_desc add "new_project projectName thesis -author \"Jane Doe\" "
set_desc add "new_project projectName beamer"

# Set the list of options with description
set_opt_list add -h "Display this manual"
set_opt_list add -author "Author name"
set_opt_list add -fins "Path of file.ins with general informations on author in a letter"
set_opt_list add -fname "Name of the document"


if [ "$_SET_DEFAULT_" = "1" ]; then
    # Set default values to the options.
    mauthor="John Doe"
    mfins="NONE"
    mfname="NONE"
fi
