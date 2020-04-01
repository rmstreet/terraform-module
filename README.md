# terraform-module

Esse modulo :
* Cria instância

## Dependências

Para usar o make você precisa:

 - [terraform](https://www.terraform.io/) >= 0.12
 - [make](https://www.gnu.org/software/make/)

## Usando

Crie um arquivo **terrafile.tf** na raiz do seu projeto, você pode seguir esse exemplo:

```terraform
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {    
    bucket = "teste-tfstates-terraform" # TROCAR PARA SEU BUCKET
    key    = "terraform-test.tfstate" # NOME QUE DESEJA DAR AO ARQUIVO
    region = "us-east-1"
  }
}

module "produto" {
  source                  = "git@github.com:rmstreet/terraform-module.git?ref=v0.1" # VERIFICAR VERSÕES
  name                    = "produto"
}

output "ip_address" {
  value = module.produto.ip_address
}
```

Crie seu arquivo **.env** a partir do exemplo **.env.example**


## Inputs

| **Nome** | **Descrição** | **Tipo** | **Default** | **Requerido** |
|------|-------------|:----:|:-----:|:-----:|
| **name** |  Nome do projeto | string | n/a | sim |
| **hash\_commit** | Hash commit da imagem AMI | string | 806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44 | não |
| **enable\_sg** | Habilitar feature de criar security group | bool | false | não |
| **ingress\_ports** | Lista de portas para liberar | list | [] | não |
| **instance\_count** | Quantidade de instâncias a serem criadas | int | 1 | não |

# ToDo

- [ ] Colocar suporte a security group
- [ ] Tirar dependência da minha AMI