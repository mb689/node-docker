const protect = (req, res, next) => {
    const {user} = req.session 
    if(!user){
        return res.status(401).json({
            status: 'fail',
            message: 'unauthorized'
        })
    }
    req.usre = user
    next()
}

module.exports = protect