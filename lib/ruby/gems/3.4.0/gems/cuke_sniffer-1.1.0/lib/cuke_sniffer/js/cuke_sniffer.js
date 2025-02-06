var CukeSniffer = {
    init: function(){
        CukeSniffer.actions.bind();
        CukeSniffer.view._startTooltips();
        CukeSniffer.view._updateRowColors();
        CukeSniffer.view._disableRulesFromLocalStorage();
    },
    view: {
        _disableRulesFromLocalStorage: function(){
            $.each($("[data-rule-symbol]"), function(index, rule){
                var $rule = $(rule),
                    symbol = $rule.data("rule-symbol"),
                    hasCookie = localStorage.getItem(symbol) != undefined;
                if(hasCookie){
                    $rule.find("input").click();
                }
            });
        },
        toggleDetails: function(){
            $(this).closest(".deadStep, .feature, .stepDefinition, .hook").find(".row > .details").slideToggle();
        },
        _startTooltips: function(){
            $("[title]").tooltip();
        },
        _updateRowColors: function(){
            $(".rule:visible:even, .deadStep:even, .feature:even, .stepDefinition:even, .hook:even").addClass("blueRow");
        },
        _updateVisibleItems: function(){
            $(".feature, .backgroundProblems, .scenario, .scenarios, .stepDefinition, .hook").hide();
            CukeSniffer.view._updateVisibleFeatureIssues();
            CukeSniffer.view._updateVisibleStepDefinitionIssues();
            CukeSniffer.view._updateVisibleHookIssues();
        },
        _updateVisibleFeatureIssues: function(){
            var $visibleFeatures = $(".feature:has([show])"),
                $visibleBackground = $(".backgroundProblems:has([show])"),
                $visibleScenarioBlocks = $(".scenarios:has([show])"),
                $visibleScenarios = $(".scenario:has(.details [data-improvement-row][show])");

            $visibleFeatures.show();
            $visibleBackground.show();
            $visibleScenarioBlocks.show();
            $visibleScenarios.show();
            $visibleScenarios.find(".details").show();
        },
        _updateVisibleStepDefinitionIssues: function(){
            var $visibleStepDefinition = $(".stepDefinition:has([show])")
            $visibleStepDefinition.show();
        },
        _updateVisibleHookIssues: function(){
            var $visibleHooks = $(".hook:has([show])")
            $visibleHooks.show();
        }
    },
    actions: {
        bind: function(){
            CukeSniffer.actions._bindExpandAll();
            CukeSniffer.actions._bindCollapseAll();
            CukeSniffer.actions._bindShowDeadSteps()
            CukeSniffer.actions._togglePanelHeaderIcons();
            CukeSniffer.actions._viewRules();
            CukeSniffer.actions._clickRow();
            CukeSniffer.actions._ruleFilters();
            CukeSniffer.actions.toggleDetails();
            CukeSniffer.actions.enableAllRules();
            CukeSniffer.actions.disableAllRules();
            CukeSniffer.actions.changeRuleStatus();
        },
        _bindExpandAll: function(){
            $(document).on("click", "[expand]", function(){
                $(this).closest(".panel-body").find(".details").show();
            });
        },
        _bindShowDeadSteps: function(){
            $("#step_definitions .deadStep").hide();
            $(document).on("click", "#showDeadSteps", function(){
                $("#step_definitions .deadStep").toggle()
            });
        },
        _bindCollapseAll: function(){
            $(document).on("click", "[collapse]", function(){
                $(this).closest(".panel-body").find(".details").hide();
            });
        },
        _togglePanelHeaderIcons: function(){
            $(document).on("click", ".panel-title", function(){
                var $icon = $(this).find(".glyphicon");
                $icon.toggleClass("glyphicon-menu-down");
                $icon.toggleClass("glyphicon-menu-up");
            });
        },
        _viewRules: function(){
            $(document).on("click", "#rulesTab", CukeSniffer.view._updateRowColors);
        },
        _clickRow: function(){
            $(document).on("click", ".rule", function(){
                var $details = $(this).find(".details");
                $details.toggle();
            });
            $(document).on("click", ".rule :checkbox", function(event){
                event.stopPropagation();
            });
        },
        _ruleFilters: function(){
            $(document).on("click", "#ruleFilters .btn", function(){
                var $clickedCheckbox = $(this).find(":checkbox");
                $(".rule").hide().removeClass("blueRow");
                $("#ruleFilters .btn").each(function(index, button){
                    var $checkbox = $(button).find(":checkbox"),
                        filterName = $checkbox.data("rule-type"),
                    //hate this hack.
                        checked = ($clickedCheckbox[0] == $checkbox[0]) ? !$checkbox.is(":checked") : $checkbox.is(":checked");
                    if(checked){
                        $("[rule-" + filterName + "]").show();
                    }
                });
                CukeSniffer.view._updateRowColors();
            });
        },
        toggleDetails: function(){
            $(document).on("click", ".deadStep > .row > .title," +
                " .feature > .row > .title, " +
                ".stepDefinition > .row > .title, " +
                ".hook .title", CukeSniffer.view.toggleDetails);
        },
        enableAllRules: function(){
            $(document).on("click", "#enableAllRules", function(){
                $(".rule input[type='checkbox']:not(:checked)").click();
            });
        },
        disableAllRules: function(){
            $(document).on("click", "#disableAllRules", function(){
                $(".rule input[type='checkbox']:checked").click();
            });
        },
        changeRuleStatus: function(){
            $(document).on("click", ".rule input[type='checkbox']", function(){
                var enabled = $(this).is(":checked"),
                    $rule = $(this).closest(".rule"),
                    phrase = $rule.find("[data-phrase]").html(),
                    symbol = $rule.data("rule-symbol"),
                    improvementPhraseList = [];
                if(enabled){
                    localStorage.removeItem(symbol);
                } else {
                    localStorage.setItem(symbol, true);
                }
                if(phrase.indexOf("{class}") != -1) {
                    var targets = $(this).closest(".rule").find("[data-targets]").html().trim().split(", ");
                    if(targets.indexOf("Scenario") != -1){
                        targets.push("Scenario Outline");
                    }
                    $.each(targets, function (n, target) {
                        improvementPhraseList.push(phrase.replace("{class}", target))
                    });
                } else if(phrase.indexOf("{word}") != -1){
                    var targets = $(this).closest(".rule").find("[data-conditions]").html().trim().replace("[", "").replace("]", "").replace(/\"/g, "").split(", ");
                    $.each(targets, function (n, target) {
                        improvementPhraseList.push(phrase.replace("{word}", target))
                    });
                } else {
                    improvementPhraseList.push(phrase)
                }
                (enabled) ? CukeSniffer.actions._enableRule(improvementPhraseList) : CukeSniffer.actions._disableRule(improvementPhraseList);
            });
        },
        _enableRule: function(improvementPhraseList){
            $.each(improvementPhraseList, function(n, phrase){
                var $all = $("[data-improvement-row]:has([data-improvement='" + phrase +"'])");
                $all.show();
                $all.attr("show", true);
            });
            CukeSniffer.view._updateVisibleItems();
        },
        _disableRule: function(improvementPhraseList){
            $.each(improvementPhraseList, function(n, phrase){
                var $all = $("[data-improvement-row]:has([data-improvement='" + phrase +"'])");
                $all.hide();
                $all.removeAttr("show");
            });
            CukeSniffer.view._updateVisibleItems();
        }
    }
};