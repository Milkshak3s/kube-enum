# set getUsersOutput to list of users
getUsersOutput=($(kubectl config get-users | awk '(NR>1)'))
echo ${getUsersOutput[0]}


# TODO: get list of namespaces for matrix

# TODO: get list of clusters for matrix

# TODO: construct context matrix from users / ns / clusters




# TODO: Add util for enuming all secrets with `kubetctl get secrets -o yaml` bypassing describe perms

# TODO: Add util for listing all pod names / image / location

# TODO: Add util for enuming all can-i perms by context

# TODO: Add util for enuming all get perms w/o can-i, by context


# TODO: Add util for enuming pod exec perms by pod / context combo
