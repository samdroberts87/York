# Basic VPC deployment

Multi account strategy utilising terraform

## Triple workflow structure
- Code integration and testing pipeline
- Infrastrure deployment pipeline
- Infrastructure destroy pipeline
- Custom python script to clear down backend (state for backend S3 dies with first workflow)

![Architecture Diagram](assets/york.drawio_new.png)
