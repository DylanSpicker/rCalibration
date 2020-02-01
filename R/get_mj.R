  #' An Estimator for error-covariance matrix.
  #'
  #' The generalized estimator works on error models with covariance of the form cov(X) + Mj; this function estimates the residual Mj term.
  #' 
  #' @inheritsParams generalizedRC
  #' @return A list M_j, the error-covariance structure matrix.
  #' @seealso [getOptimalWeights()] which calls this function to compute weights [generalizedRC()] which uses this if non-optimal weights are selected
  #' @export
  #' @examples
  #' getMj(W)

getMj <- function(W) {
  # List of Estimates for Xj* Covariance
  SigmaXstar <- lapply(W, function(x){ 
    x_c <- t(x) - colMeans(x)
    return(1/(nrow(x) - 1)*x_c%*%t(x_c))
  })

  # List of k Data Matrices containing Xi*(j) 
  BarXistar_j <- lapply(W, function(x){
    return((1/(k-1))*(Reduce("+", W)-x))
  })
  
  # Generate Full M-hat
  Mhat <- (k-1)/(k*n)*Reduce("+", lapply(1:k, function(ii_x){
      Wc <- W[[ii_x]] - BarXistar_j[[ii_x]]
      return(t(Wc)%*%Wc)
  }))

  # Compute the estimate for covariance of X
  Sigma_XX1 <- (1/k)*(Reduce("+", SigmaXstar) - Mhat)

  lapply(SigmaXstar, function(x){ return(x - Sigma_XX1)})
}