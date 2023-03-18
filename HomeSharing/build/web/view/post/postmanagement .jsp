<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">
  <a class="navbar-brand" href="#">Angular Bootstrap Demo</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse"
    aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">

      <li class="nav-item">
        <a class="nav-link" routerLink="/home">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" routerLink="/contact-list">Contacts</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" routerLink="/contact-create">Create</a>
      </li>

    </ul>
  </div>
</nav>

</html>
