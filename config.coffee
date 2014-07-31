
module.exports =
    projectName: process.env.PROJECT_NAME || require('path').basename(__dirname)
    env: process.env.NODE_ENV || 'development'
    

    http:
        port: process.env.PORT || 3000
        host: process.env.BIND_IP || '0.0.0.0'

    logFormat: ':date-padded :remote-addr-padded :method-padded :url -> :status (:res[content-length] bytes in :response-time ms) ":referrer" ":user-agent"'
    trustProxy: JSON.parse(process.env.TRUST_PROXY || "1") # Trust first proxy (nginx)

