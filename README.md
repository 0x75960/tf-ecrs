terraform ECR repositories
============================

a terraform module make ECR repositories with access role

```terraform
module "ecr_repositories" {
	source = "github.com/0x75960/tf-ecrs"

	accessor-role       = "awesome-project-image-user"
	service-assume-role = "eks.amazonaws.com"
	image-scope         = "awesome-project"

	images = [
		"sugoi",
		"tsuyoi"
	]

	immutable = true
	scanning  = true
}
```

This will make
1. ECR repositories (awesome-project/sugoi, awesome-project/tsuyoi)
2. IAM Role `awesome-project-image-user` who has `ecr:*` for these repository for `eks.amazonaws.com`
