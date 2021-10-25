#!/bin/sh -l

dataFactoryDirectory=$1
dataFactoryId=$2

armTemplateOutputSubDirectory="armTemplate"

cd $dataFactoryDirectory
ls -l

echo "Installing Azure Data Factory package..."
npm install

echo "Validating $dataFactoryId at $(pwd)"
npm run build validate $(pwd) $dataFactoryId

armTemplateOutputDirectory="$dataFactoryDirectory/$armTemplateOutputSubDirectory"
echo "Exporting $dataFactoryId to $armTemplateOutputDirectory"
npm run build export $(pwd) $dataFactoryId $armTemplateOutputSubDirectory

echo "::set-output name=arm-template-directory::$armTemplateOutputDirectory"