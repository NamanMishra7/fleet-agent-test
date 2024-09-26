# fleet-test

A Fleet import repository for testing purposes. If assigned the correct
credentials, Fleet will import the contents of this repository periodically.

## /configurations

The configurations directories use the following naming conventions:

```
/configurations/{{agent_type}}/{{platform}}/{{name}}/path/to/config_file.{{ext}}
```

`{{agent_type}}` is the Fleet agent_type ID associated with the configuration.
For example: "otelcol".

`{{platform}}` is the Fleet platform ID associated with the configuration.
For example: "linux".

`{{name}}` is a user defined name for the configuration. For example: "default".

`/path/to/config_file.{{ext}}` is the generic path to the file on the
filesystem. For example: /etc/otelcol/config.yaml.

The `{{ext}}` portion is the file extension used to determine the configuration
format. Supported values are ".yaml", ".toml", and ".json". Any other file
extensions will be treated as plain text configurations.

If the first line of a configuration file is a comment, it will be treated as
a configuration description when imported into Fleet.

## /packages

The packages directories use the following naming conventions:

```
/packages/{{agent_type}}/{{platform}}/{{name}}.zip
```

`{{agent_type}}` is the Fleet agent_type ID associated with the package.
For example: "otelcol".

`{{platform}}` is the Fleet platform ID associated with the pckage.
For example: "linux".

`{{name}}` is a user defined name for the package. For example: "default".

Packages are defined via scripts and files placed in hidden folders using the
same conventions, but placing a `.` before the agent_type. Therefore the files
contained in the directory `/packages/.otelcol/linux/default/` are zipped into
the package `/packages/otelcol/linux/default.zip`.
