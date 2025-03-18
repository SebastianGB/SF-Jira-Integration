import { api, LightningElement, wire } from 'lwc';
import checkJiraKeyAvailable from '@salesforce/apex/JiraProjectWizardController.checkJiraKeyAvailable';
import createProject from '@salesforce/apex/JiraProjectWizardController.createProject';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import PROJECT_KEY from "@salesforce/schema/Account.Jira_Project_Key__c";
import PROJECT_NAME from "@salesforce/schema/Account.Jira_Project_Name__c";
import PROJECT_ID from "@salesforce/schema/Account.Jira_Project_Key__c";

export default class JiraProjectWizard extends LightningElement {

    @api recordId;
    @api objectNameId;
    projectLead;
    projectName;
    key;
    available;
    notCheckedKey = true;
    projectCreationDisabled = true;

    filter = {
        criteria: [
          {
            fieldPath: "JIRA_User_Id__c",
            operator: "ne",
            value: ""
          }
        ]
      };

    @wire(getRecord, {
        recordId:"$recordId",
        fields: [PROJECT_KEY, PROJECT_NAME, PROJECT_ID]
    })

    wiredAccount({error, data}) {
        if (data) {
            this.account = data;
            if (getFieldValue(data, PROJECT_ID)) {
                this.dispatchEvent(new CloseActionScreenEvent());
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Project already exists DUH',
                    message: 'You are trying to create a project that already exists.',
                    variant:'error'
                }));
            }
        } else if (error) {
            console.log(error);
        }

    }
    handleKeyChange(event) {
        this.key = event.target.value;
    }

    handleNameChange(event) {
        this.projectName = event.target.value;
    }

    handleLeadChange(event) {
        this.projectLead = event.target.value;
        this.checkProjectCreation();
    }

    async handleKeyCheck() {
        try {
            this.available = await checkJiraKeyAvailable({ key: this.key });
            this.notCheckedKey = false;
            this.checkProjectCreation();
        } catch (error) {
            console.error(error);
        }
    }

    checkProjectCreation() {
        this.projectCreationDisabled = !this.available || !this.projectLead || this.notCheckedKey;
    }

    async handleProjectCreate() {
        try {
            await createProject({
                key: this.key,
                projectName: this.projectName,
                accId: this.recordId,
                userId: this.projectLead
            });
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Jira Project Created',
                    variant: 'success'
                })
            );
        } catch (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'Could not create Jira Project',
                    variant: 'error'
                })
            );
        }
    }
}