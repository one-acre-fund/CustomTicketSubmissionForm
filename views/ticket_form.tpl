<link rel="stylesheet" href="/css/form_styles.css">
<div id="ticket_form">
    <div class='title'>Submit a ticket</div>
    % if feedback:
    <div class="feedback">{{feedback}}</div>
    % end
    <form action="create_ticket" method="post">
        <ul>
            <li><input type="text" placeholder="Ticket subject" name="subject" class="field" required></li>
            <li><textarea placeholder="What's the problem?" name="description" rows="6" class="field" required></textarea></li>
            % if no_email:
            <li><input type="email" placeholder="Your email address" name="email" class="field" required>
                <div class="register">
                    <a href="https://oneacrefundglobalhr.zendesk.com/auth/v2/login/registration" target="_blank">Register</a> 
                    so our support team can email you to solve your problem.
                </div>
            </li>
            % end
            <li>
                <select name="country" required>
                    <option value="" disabled selected hidden>Select the Country</option>
                    <option value="kenya">Kenya</option>
                    <option value="uganda">Uganda</option>
                    <option value="tanzania">Tanzania</option>
                    <option value="rwanda">Rwanda</option>
                    <option value="saab">Burundi</option>
                    <option value="malawi">Malawi</option>
                    <option value="zambia">Zambia</option>
                    <option value="nigeria">Nigeria</option>
                    <option value="global">Global Issue</option>
                </select>
            </li>
            <li>
                <select name="category" required>
                    <option value="" disabled selected hidden>Select the Category of Issue</option>
                    <option value="Leave::Annual Leave">Leave::Annual Leave</option>
                    <option value="Leave::Sick Leave">Leave::Sick Leave</option>
                    <option value="Payroll Issues">Payroll Issues</option>
                    <option value="Other">Other</option>
                    <option value="Policies">Policies</option>
                    <option value="Advisory">Advisory</option>
                    <option value="Transport Allowances">Transport Allowances</option>
                    <option value="Casuals">Casuals</option>
                    <option value="Success Factor">Success Factor</option>
                    <option value="Tablets">Tablets</option>
                    <option value="Benefits">Benefits</option>
                </select>
            </li>
            <li><input type="submit" value="Submit"></li>
        </ul>
    </form>
</div>