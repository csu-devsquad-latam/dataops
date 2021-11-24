# DataOps with GitHub Actions

## Overview

One of the offerings of the DevSquad is help customers implement DataOps practices and technologies, through an engagement we call Milestone Zero.
![Milestone Zero](assets/img/m0.png)

Usually customers are comfortable deploying Data technologies and assets in the Azure portal, but they have found a hard time when trying to do it through GitHub Actions or Azure DevOps.

Most of the help needed has been around these different workloads:

* Infrastructure as Code: mostly for the Azure products below.
* Databricks: help needed to manage Databricks notebooks and libraries, both for Continuous Integration and Continuous Deployment.
* Azure Data Factory: help needed to manage pipelines, linked services and other configurations, all for Continuous Integration and Continuous Deployment.
* Azure Synapse: help needed to manage SQL pool assets such as tables, stored procedures, views, etc. all for Continuous Integration and Continuous Deployment.

In this repository, we present an example on how to implement some practices for the workloads mentioned above.

## Folder Structure

    dataops
    │   README.md
    │   config.json - File with some configuration for environment asset names.    
    │
    └───.github
    │   │
    │   └───actions - folder with custom actions developed for the project
    │   │
    │   └───workflows - folder with CI/CD workflows for Databricks, DataFactory and IaC.
    │   
    └───assets - available assets for documentation
    └───databricks - folder with databricks sample notebooks
    └───datafactory - folder with ADF definition
    └───infrastructure - folder with bicep definitions of onfrastructure
    └───synapse - folder with sql profiles, scripts and database project.

## Custom Actions

As a result of this project, we decided some of the custom actions we create were valuable to share.

### Azure Data Factory

* [data-factory-validate](https://github.com/marketplace/actions/data-factory-validate): GitHub Action that validates all the Azure Data Factory resources in your Git repository using the Azure Data Factory utilities package.

* [data-factory-export](https://github.com/marketplace/actions/data-factory-export): GitHub Action that exports all the Azure Data Factory resources stored in your Git repository to an ARM Template using the Azure Data Factory utilities package.

* [data-factory-deploy](https://github.com/marketplace/actions/data-factory-deploy): GitHub Action for side-effect free deployment of Azure Data Factory resources.

### Infrastructure as Code (Bicep)

* [bicep-build-output](https://github.com/marketplace/actions/bicep-build-output): GitHub Action that builds a Bicep main file and outputs a generated ARM Template file.

* [deployment-what-if](https://github.com/marketplace/actions/deployment-what-if): GitHub Action that previews the effects of your Azure infrastructure changes before its deployment by running an ARM template deployment what-if operation.

### Databricks

* [install-databricks-cli](https://github.com/marketplace/actions/install-databricks-cli): GitHub Action that installs the Databricks CLI.

* [scalastyle-validate](https://github.com/marketplace/actions/scalastyle-validate): GitHub Action that examines your Scala code and indicates potential problems with Scalastyle.

* [scalastyle-download](https://github.com/marketplace/actions/scalastyle-download): GitHub Action that downloads Scalastyle jar.

### Cross Azure services utils

* [azure-resource-login-action](https://github.com/Azure/azure-resource-login-action): GitHub Action to get raw access token for a specific type of resource in Azure.

## References

* [Synapse CI/CD](https://github.com/santiagxf/synapse-cicd): Repository to check the full detailed implementation for Synapse CI/CD pipelines with Github Actions.
