Neste mini-laboratório, vamos provisionar um EC2 usando o terraform do Hashicorps.

Referencia:
https://www.terraform.io/docs/providers/aws/index.html

## Oque é Terraform? 

Terraform é uma ferramenta feita pela Hashicorp para construir, alterar e criar versões de infraestrutura com segurança e eficiência. Terraform pode gerenciar provedores de serviços existentes e populares (AWS, Azure, Google Cloud), bem como soluções internas personalizadas.

Você pode comparar o **Terraform** com o **CloudFormation**. Eles são semelhantes, mas ao mesmo te tempo têm diferenças.

### Passos para provisionar

1) Instale o Terraform, conforme a documentação oficial https://learn.hashicorp.com/tutorials/terraform/install-cli

> Se os usuários MAC tiverem `homebrew` instalado em sua máquina:
> Basta fazer: `brew install terraform`
> Vá para a etapa `3`

2) Certifique-se de que o binário do terraform está disponível no PATH. 

Para Mac/Linux. No Shell/Terminal, vá para a pasta onde o binário do terraform é extraído 
```console
echo $"export PATH=\$PATH:$(pwd)" >> ~/.bash_profile
source ~/.bash_profile
```

Para usuários do Windows: Siga isto para adicionar o Terraform ao PATH https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows

> Se os usuários do Windows tiverem `chocolatey` instalado em sua máquina:
> Basta fazer: `choco install -y terraform`
> Vá para a etapa `3`
> [Clique aqui](https://chocolatey.org/docs/installation) para obter instruções de instalação `chocolatey`.

3) Crie um novo diretório (pode ter qualquer nome) e vá para dentro do diretório
```console
mkdir Lab001 && cd Lab001
```

4) Cole este código a seguir em um arquivo chamado ec2.tf (Pode ser qualquer nome com a extensão .tf)

#### Configuração mínima viável

```HCL
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"
}

resource "aws_instance" "example_ec2" {
  ami		= "ami-0817d428a6fb68645"
  instance_type = "t2.micro"
}
```
#### Nota:

5) Substitua o ACCESS_KEY_HERE E SECRET_KEY_HERE por suas cresdencias de usuário AWS IAM com permissões suficientes anexadas. Você pode acessar o console do IAM na AWS conforme imagem abaixo.

##### PS:

Se você configurou o AWS CLI e tem as credenciais armazenadas, pode pular a parte das credenciais.

Primeiro, vá para o console de gerenciamento IAM. 
![iam](https://github.com/pmarcelojr/terraform-aws-labs/blob/master/image/iam-console.png)

Em seguida, clique no nome do usuário e navegue até a gui de credenciais de segurança. Clique em criar chaves de acesso.
![iam](https://github.com/pmarcelojr/terraform-aws-labs/blob/master/image/generate-access-keys.png)

Baixe o arquivo csv para sua segurança ou clique em mostrar chaves. Agora você tem access_key e secret_key necessários para o código do Terraform acima.
![iam](https://github.com/pmarcelojr/terraform-aws-labs/blob/master/image/iam-generated-keys.png)



Se você quiser simplesmente omitir as credenciais da AWS, o Terraform pesquisará automaticamente as credenciais de API salvas (Por exemplo, em ~/.aws/credentials) ou credenciais de perfil de instância IAM. Esta opção é muito mais limpa para situações em que arquivos .tf são verificados no controle de origem.

6) Inicializar o diretório de trabalho para o Terraform:
```console 
terraform init
```

"O comando **terraform init** é usado para inicializar um diretório de trabalho contendo arquivos de configuração do Terraform. Este é o primeiro comando que deve ser executado após escrever um nova configuração do Terraform ou clonar uma existente do controle de versão. É seguro executar este comando várias vezes."

7) Provisione o EC2 com este comando abaixo: 
```console
terraform apply
```

8) Faça login no console de gerenciamento da AWS e navegue até o console de gerenciamento EC2. Verifique se a instância foi provisionada.


9) Em seu Shell/Terminal, destrua os recursos com o seguinte comando:
```console
terraform destroy
```


É issoa aí!! Você instalou o Terraform e usou para provisionar uma instância EC2.

let's go ahead