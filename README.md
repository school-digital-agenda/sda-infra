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
- Definir a variável de ambiente `TF_VAR_mq_password` com a senha para o rabbitMQ.
- Executar os comando do terraform para aplicar as alterações no provedor (aws).

### Outputs

Principais outputs para tomar nota após a execução:

**cluster_endpoint:** Endpoint do cluster EKS, utilizado para executar os comando do kubernetes.
**ec2_bastion_eip:** IP publico do servidor bastion.
**rds_hostname:** Host do servidor de banco de dados RDS.

### Pós instalação

É recomendado desligar a instancia do Bastion host quando não estiver sendo utilizado. Para isso siga as instruções:

> # Stop EC2 Instance (Bastion Host)
> 1. Login to AWS Mgmt Console
> 2. Go to Services -> EC2 -> Instances -> sda-stag-BastionHost -> Instance State -> Stop

## Trabalhando com o EKS

``` bash
# Configurar contexto (é necessário configurar o AWS CLI na máquina)
aws eks --region us-east-1 update-kubeconfig --name sda-prod-eks-sda1-cluster

# Listar nodes
kubectl get nodes

# Listar Services
kubectl get svc

# Verify Namespaces
kubectl get ns 

# Verify all resources on ns
kubectl get all -n kube-node-lease
kubectl get all -n kube-public
kubectl get all -n default
kubectl get all -n kube-system

# Verify Kubernetes Worker Nodes
kubectl get nodes -o wide

```

## Conexão pelo bastion-host
```bash
# Conectar por ssh
ssh -i private-key/sda-terraform-key.pem ec2-user@<Bastion-EC2-Instance-Public-IP>

# Conectar no worker node do EKS (a partir do bastion)
ssh -i /tmp/sda-terraform-key.pem ec2-user@<Public-NodeGroup-EC2Instance-PrivateIP> 
```

### Verificações do K8s
``` bash
# Verificar processos do k8s
ps -ef | grep kube

# Verify kubelet-config.json
cat /etc/kubernetes/kubelet/kubelet-config.json

# Verify kubelet kubeconfig
cat /var/lib/kubelet/kubeconfig

# Caso necessário instale o bind utils
sudo yum install bind-utils

#Verificar resolução do DNS (pegar o cluster.server do kubeconfig para resolução)
nslookup <EKS Cluster API Server Endpoint>
```

[1]: topologia.png