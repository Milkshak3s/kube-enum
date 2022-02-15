# set getUsersOutput to list of users
getUsersOutput=($(kubectl config get-users | awk '(NR>1)'))


# get list of namespaces for matrix
namespacesFromFile=($(cat namespaces.txt))


# get list of clusters for matrix
# clustersFromFile=($(cat clusters.txt))
getClustersOutput=($(kubectl config get-clusters | awk '(NR>1)'))


# TODO: construct context matrix from users / ns / clusters
# echo commands to build matrix
i=0
for CLUSTER in "${getClustersOutput[@]}"
do
	j=0
	for USER in "${getUsersOutput[@]}"
	do
		k=0
		for NS in "${namespacesFromFile[@]}"
		do
			NAME="c$i-u$j-n$k"
			echo "kubectl set-config $NAME --cluster=$CLUSTER --user=$USER --namespace=$NS"
			((k=k+1))
		done
		((j=j+1))
	done
	((i=i+1))
done


# TODO: Add util for enuming all secrets with `kubetctl get secrets -o yaml` bypassing describe perms

# TODO: Add util for listing all pod names / image / location

# TODO: Add util for enuming all can-i perms by context

# TODO: Add util for enuming all get perms w/o can-i, by context

# TODO: Add util for enuming pod exec perms by pod / context combo


# TODO: Add ability to execute command across any combination of cluster / user / namespace; i.e. all clusters & NSs a single user, 1 cluster 1 ns all users, etc.
