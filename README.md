# School Digital Agenda - Infrastructure

> Infraestrutura em terrafrom para o projeto SDA.

## Dependências

| Módulo                | Versão  |
|-----------------------|---------|
| Terraform             | 1.2     |
| AWS Provider          | 4.22    |
| VPC Module            | 3.14.2  |
| security-group Module | 4.9.0   |
| ec2-instance Module   | 4.0     |

## Topologia
![Topologia AWS][1]

## Execução

- Disponibilizar a chave PEM na pasta local: `./private-key/sda-terraform-key.pem`
- Definir a variável de ambiente `TF_VAR_db_password` com a senha para o banco de dados.
- Executar os comando do terraform para aplicar as alterações no provedor (aws).

### Outputs

Principais outputs para tomar nota após a execução:

**cluster_endpoint:** Endpoint do cluster EKS, utilizado para executar os comando do kubernetes.
**ec2_bastion_eip:** IP publico do servidor bastion.
**rds_hostname:** Host do servidor de banco de dados RDS.

[1]: topologia.png