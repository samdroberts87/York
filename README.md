# Basic VPC deployment

Multi account strategy utilising terraform

## Triple workflow structure
- ![Intergration Tests](https://github.com/samdroberts87/York/actions/workflows/inegration_tests.yml/badge.svg?branch=main)
- ![Deployment Pipeline](https://github.com/samdroberts87/York/actions/workflows/deployment.yml/badge.svg?branch=main)
- ![Destroy Pipeline](https://github.com/samdroberts87/York/actions/workflows/destroy-workflow.yml/badge.svg?branch=main)
<br>

## Additional script to clear down Back end
- Custom python script to clear down backend (state for backend S3 dies with first workflow)

![Architecture Diagram](assets/york.drawio_new.png)

Multi account strategy utilising terraform

## Triple workflow structure
- Code integration and testing pipeline
- Infrastrure deployment pipeline
- Infrastructure destroy pipeline
- Custom python script to clear down backend (state for backend S3 dies with first workflow)

![Architecture Diagram](assets/york.drawio_new.png)
