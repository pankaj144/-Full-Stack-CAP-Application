using { sap.capire.incidents as my } from '../db/schema';

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
service ProcessorService { 
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers;
}

annotate ProcessorService.Incidents with @odata.draft.enabled; //
annotate ProcessorService.Incidents with @(requires: 'support'); //enable authentication and authorization for your CAP application


/**
 * Service used by administrators to manage customers and incidents.
 */
service AdminService {
    entity Customers as projection on my.Customers;
    entity Incidents as projection on my.Incidents;
    }

annotate AdminService with @(requires: 'admin'); //enable authentication and authorization for your CAP application
/**
 * User with admin role can perfom admin activities such as auditing logs.
 */

