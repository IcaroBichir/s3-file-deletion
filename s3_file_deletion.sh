#!/bin/bash

function die() {
  die() { echo "$*" 1>&2 ; exit 1; }
}

function errorIfEmpty() {
  name=$1
  value=$2
  if [[ ${value} == "" ]]; then
    die "${name}" is required
  fi
}

errorIfEmpty "DATE" ${DATE}
errorIfEmpty "AWS_REGION" ${AWS_REGION}
errorIfEmpty "AWS_PROFILE" ${AWS_PROFILE}
errorIfEmpty "BUCKET_NAME" ${BUCKET_NAME}

DRY_RUN=${DRY_RUN-true}

aws --profile ${AWS_PROFILE} --region ${AWS_REGION} s3api list-objects-v2 --bucket ${BUCKET_NAME} --query "Contents[?contains(LastModified, \`$DATE\`)].Key" | while read OBJECT; do
  if [[ ${DRY_RUN} = "false" ]]; then
    aws --profile ${AWS_PROFILE} --region ${AWS_REGION} s3 rm s3://${BUCKET_NAME}/"${OBJECT}"
    echo "${OBJECT} S3 OBJECT DELETED"
  else
    echo "DRY_RUN execution: S3 bucket file ${OBJECT} will be deleted"
  fi
done
