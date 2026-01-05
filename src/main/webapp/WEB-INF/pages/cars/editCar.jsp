<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Edit Car">
    <style>
        .form-control.is-invalid,
        .form-select.is-invalid {
            border-color: #dc3545;
            padding-right: calc(1.5em + 0.75rem);
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(0.375em + 0.1875rem) center;
            background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
        }

        .invalid-feedback {
            display: none;
            width: 100%;
            margin-top: 0.25rem;
            font-size: 0.875em;
            color: #dc3545;
        }

        .was-validated .form-control:invalid,
        .was-validated .form-select:invalid {
            border-color: #dc3545;
            padding-right: calc(1.5em + 0.75rem);
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(0.375em + 0.1875rem) center;
            background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
        }

        .was-validated .form-control:invalid ~ .invalid-feedback,
        .was-validated .form-select:invalid ~ .invalid-feedback {
            display: block;
        }
    </style>

    <h1>Edit Car</h1>

    <div class="row">
        <div class="col-md-6">
            <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditCar">
                <div class="mb-3">
                    <label for="license_plate" class="form-label">License Plate</label>
                    <input type="text" class="form-control" id="license_plate" name="license_plate" placeholder=""value="${car.licensePlate}" required>
                    <div class="invalid-feedback">
                        License Plate is required.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="parking_spot" class="form-label">Parking Spot</label>
                    <input type="text" class="form-control" id="parking_spot" name="parking_spot"  placeholder=""value="${car.parkingSpot}" required>
                    <div class="invalid-feedback">
                        Parking Spot is required.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="owner_id" class="form-label">Owner</label>
                    <select class="custom-select d-block w-100" id="owner_id" name="owner_id" required>
                        <option value="">Choose...</option>
                        <c:forEach var="user" items="${users}" varStatus="status">
                            <option value="${user.id}"  ${car.ownerName eq user.username ? 'selected' : ' '} >${user.username}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Please select an owner.
                    </div>
                </div>

                <hr class="mb-4">
                <input type="hidden" name="car_id" value="${car.id}" />
                <button class="btn btn-primary" type="submit">Save</button>

            </form>
        </div>
    </div>

</t:pageTemplate>