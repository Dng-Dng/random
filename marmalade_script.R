#read in data
w = read.table('marmalade.txt')[[1]]
N = 60

#create stan model
model <- stan_model('marmalade.stan')

#pass data to stan and run model
options(mc.cores=4)
fit <- sampling(model, list(N=N,x=w), iter=1000, chains=4);

# Graph mu
params <- extract(fit)
print(fit)
hist(params$mu, col='red', xlab = 'mu', xlim = c(410, 440))

# find mu <425
pnorm(425,params$mu, params$sigma)

pnorm(425, 424.45, 5.69) 
